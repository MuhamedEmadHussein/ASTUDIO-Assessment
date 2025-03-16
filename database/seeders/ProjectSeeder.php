<?php

namespace Database\Seeders;

use App\Models\Project;
use App\Models\User;
use App\Models\Attribute;
use App\Enums\AttributeType;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ProjectSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create sample attributes once
        $attributes = [
            'department' => Attribute::firstOrCreate([
                'name' => 'department',
                'type' => AttributeType::SELECT->value,
            ], ['options' => json_encode(['IT', 'HR', 'Finance', 'Marketing', 'Operations'])]),

            'start_date' => Attribute::firstOrCreate([
                'name' => 'start_date',
                'type' => AttributeType::DATE->value
            ]),

            'end_date' => Attribute::firstOrCreate([
                'name' => 'end_date',
                'type' => AttributeType::DATE->value
            ]),

            'budget' => Attribute::firstOrCreate([
                'name' => 'budget',
                'type' => AttributeType::NUMBER->value
            ])
        ];

        // Get user IDs once
        $userIds = User::pluck('id')->toArray();
        if (empty($userIds)) {
            return;
        }

        // Define batch size
        $batchSize = 5;
        $totalProjects = 10;

        // Keep track of last inserted ID
        $lastProjectId = DB::table('projects')->max('id') ?? 0;

        for ($i = 0; $i < $totalProjects; $i += $batchSize) {
            DB::transaction(function () use ($attributes, $userIds, $batchSize, &$lastProjectId) {
                $currentBatch = [];
                $projectUserRelations = [];
                $attributeValues = [];
                $timestamp = now();

                // Create current batch of projects
                for ($j = 0; $j < $batchSize; $j++) {
                    $lastProjectId++;
                    $currentBatch[] = [
                        'id' => $lastProjectId,
                        'name' => fake()->sentence(3),
                        'status' => fake()->randomElement(['active', 'pending', 'completed']),
                        'created_at' => $timestamp,
                        'updated_at' => $timestamp,
                    ];

                    // Prepare project-user relationships
                    $selectedUserCount = min(3, count($userIds));
                    $selectedUsers = array_rand($userIds, $selectedUserCount);
                    if (!is_array($selectedUsers)) {
                        $selectedUsers = [$selectedUsers];
                    }

                    foreach ($selectedUsers as $userId) {
                        $projectUserRelations[] = [
                            'project_id' => $lastProjectId,
                            'user_id' => $userIds[$userId],
                            'created_at' => $timestamp,
                            'updated_at' => $timestamp,
                        ];
                    }

                    // Prepare attribute values
                    $startDate = fake()->dateTimeBetween('-6 months', '+1 month')->format('Y-m-d');

                    $attributeValues[] = [
                        'project_id' => $lastProjectId,
                        'attribute_id' => $attributes['department']->id,
                        'value' => fake()->randomElement(json_decode($attributes['department']->options)),
                        'created_at' => $timestamp,
                        'updated_at' => $timestamp,
                    ];
                    $attributeValues[] = [
                        'project_id' => $lastProjectId,
                        'attribute_id' => $attributes['start_date']->id,
                        'value' => $startDate,
                        'created_at' => $timestamp,
                        'updated_at' => $timestamp,
                    ];
                    $attributeValues[] = [
                        'project_id' => $lastProjectId,
                        'attribute_id' => $attributes['end_date']->id,
                        'value' => fake()->dateTimeBetween($startDate, '+1 year')->format('Y-m-d'),
                        'created_at' => $timestamp,
                        'updated_at' => $timestamp,
                    ];
                    $attributeValues[] = [
                        'project_id' => $lastProjectId,
                        'attribute_id' => $attributes['budget']->id,
                        'value' => fake()->numberBetween(10000, 1000000),
                        'created_at' => $timestamp,
                        'updated_at' => $timestamp,
                    ];
                }

                // Bulk insert all data
                DB::table('projects')->insert($currentBatch);
                DB::table('project_user')->insert($projectUserRelations);
                DB::table('attribute_values')->insert($attributeValues);

                // Free memory
                unset($currentBatch, $projectUserRelations, $attributeValues);
            });

            // Clear query log & garbage collect
            DB::flushQueryLog();
            gc_collect_cycles();
        }
    }
}