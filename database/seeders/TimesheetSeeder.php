<?php

namespace Database\Seeders;

use App\Models\Project;
use App\Models\Timesheet;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TimesheetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get user-project relationships efficiently
        $userProjects = DB::table('project_user')
            ->select('user_id', 'project_id')
            ->get()
            ->groupBy('user_id');

        if ($userProjects->isEmpty()) {
            return;
        }

        // Process users in batches
        $batchSize = 2;
        $processedUsers = 0;

        foreach ($userProjects as $userId => $projects) {
            if ($processedUsers % $batchSize === 0) {
                // Start new transaction for each batch
                DB::beginTransaction();
                $timesheetBatch = [];
            }

            $projectIds = $projects->pluck('project_id')->toArray();

            // Create timesheets for the last 30 days
            for ($i = 0; $i < 30; $i++) {
                $date = now()->subDays($i);

                // Skip weekends
                if ($date->isWeekend()) {
                    continue;
                }

                // Create 1-3 timesheet entries per day
                $entries = rand(1, 3);
                $totalHours = 0;

                for ($j = 0; $j < $entries && $totalHours < 8; $j++) {
                    $remainingHours = 8 - $totalHours;
                    $hours = min(fake()->randomFloat(1, 1, 4), $remainingHours);

                    $timesheetBatch[] = [
                        'user_id' => $userId,
                        'project_id' => $projectIds[array_rand($projectIds)],
                        'task_name' => fake()->sentence(3),
                        'date' => $date->format('Y-m-d'),
                        'hours' => $hours,
                        'created_at' => now(),
                        'updated_at' => now(),
                    ];

                    $totalHours += $hours;
                }
            }

            $processedUsers++;

            // Insert batch and commit transaction
            if ($processedUsers % $batchSize === 0 || $processedUsers === $userProjects->count()) {
                DB::table('timesheets')->insert($timesheetBatch);
                DB::commit();

                // Clear memory
                unset($timesheetBatch);
                DB::flushQueryLog();
                gc_collect_cycles();
            }
        }
    }
}