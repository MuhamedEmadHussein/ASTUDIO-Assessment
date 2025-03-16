<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Config;
use Symfony\Component\Process\Process;
use Symfony\Component\Process\Exception\ProcessFailedException;

class DatabaseDump extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'db:dump
        {filename? : The name of the dump file}
        {--compress : Compress the dump file using gzip}
        {--no-data : Structure only, no data}
        {--tables= : Comma-separated list of specific tables to dump}
        {--exclude-tables= : Comma-separated list of tables to exclude}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a database dump with various options';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        // Validate and prepare filename
        $filename = $this->argument('filename') ?? 'database_dump_' . date('Y-m-d_His') . '.sql';
        if ($this->option('compress') && !str_ends_with($filename, '.gz')) {
            $filename .= '.gz';
        }

        // Check if file already exists
        if (file_exists($filename) && !$this->confirm("File '$filename' already exists. Do you want to overwrite it?")) {
            $this->info('Operation cancelled.');
            return 1;
        }

        // Get database configuration
        $host = Config::get('database.connections.mysql.host');
        $database = Config::get('database.connections.mysql.database');
        $username = Config::get('database.connections.mysql.username');
        $password = Config::get('database.connections.mysql.password');

        // Check if we're on Windows
        $isWindows = strtoupper(substr(PHP_OS, 0, 3)) === 'WIN';

        // Try to find mysqldump
        $mysqldump = $isWindows ? $this->findWindowsMySQLDump() : 'mysqldump';

        if ($isWindows && !$mysqldump) {
            $this->error('mysqldump not found! Please ensure MySQL is installed and add it to your PATH, or provide the full path in .env:');
            $this->line('Add this to your .env file with the correct path:');
            $this->info('MYSQL_DUMP_PATH="C:\\xampp\\mysql\\bin\\mysqldump.exe"');
            return 1;
        }

        // Build the dump command
        $command = [
            $mysqldump,
            '-h', $host,
            '-u', $username,
            '--add-drop-table',
            '--default-character-set=utf8mb4',
            '--column-statistics=0',
            '--set-gtid-purged=OFF',
        ];

        if ($password) {
            $command[] = '-p' . $password;
        }

        // Add options based on user input
        if ($this->option('no-data')) {
            $command[] = '--no-data';
        }

        if ($tables = $this->option('tables')) {
            $command = array_merge($command, explode(',', $tables));
        } elseif ($excludeTables = $this->option('exclude-tables')) {
            $command[] = $database;
            foreach (explode(',', $excludeTables) as $table) {
                $command[] = '--ignore-table';
                $command[] = $database . '.' . trim($table);
            }
        } else {
            $command[] = $database;
        }

        try {
            $this->info('Creating database dump...');

            // Create Process with output redirection
            $process = new Process($command);

            // Prepare file handling based on compression option
            if ($this->option('compress')) {
                $gzFile = gzopen($filename, 'wb9');
                $process->run(function ($type, $buffer) use ($gzFile) {
                    if (Process::OUT === $type) {
                        gzwrite($gzFile, $buffer);
                    } elseif (Process::ERR === $type) {
                        $this->error($buffer);
                    }
                });
                gzclose($gzFile);
            } else {
                $file = fopen($filename, 'wb');
                $process->run(function ($type, $buffer) use ($file) {
                    if (Process::OUT === $type) {
                        fwrite($file, $buffer);
                    } elseif (Process::ERR === $type) {
                        $this->error($buffer);
                    }
                });
                fclose($file);
            }

            if ($process->isSuccessful()) {
                $filesize = $this->getHumanFilesize(filesize($filename));
                $this->info("Database dump created successfully: $filename ($filesize)");
                return 0;
            }

            throw new ProcessFailedException($process);
        } catch (\Exception $e) {
            $this->error('Failed to create database dump: ' . $e->getMessage());
            $this->line('');
            $this->line('Troubleshooting tips:');
            $this->line('1. Ensure MySQL is installed and accessible from command line');
            $this->line('2. Add MySQL bin directory to your system PATH');
            $this->line('3. Or specify full path to mysqldump in .env file as MYSQL_DUMP_PATH');
            $this->line('4. Check if you have sufficient permissions to write to the output directory');
            $this->line('5. Ensure your MySQL user has sufficient privileges');

            // Clean up failed dump file
            if (file_exists($filename)) {
                unlink($filename);
            }
            return 1;
        }
    }

    /**
     * Try to find mysqldump.exe in common Windows locations
     */
    private function findWindowsMySQLDump(): ?string
    {
        // First check if path is specified in .env
        $configuredPath = env('MYSQL_DUMP_PATH');
        if ($configuredPath && file_exists($configuredPath)) {
            return $configuredPath;
        }

        // Common installation paths
        $commonPaths = [
            'C:\\xampp\\mysql\\bin\\mysqldump.exe',
            'C:\\wamp\\bin\\mysql\\mysql8.0.31\\bin\\mysqldump.exe',
            'C:\\wamp64\\bin\\mysql\\mysql8.0.31\\bin\\mysqldump.exe',
            'C:\\Program Files\\MySQL\\MySQL Server 8.0\\bin\\mysqldump.exe',
            'C:\\Program Files (x86)\\MySQL\\MySQL Server 8.0\\bin\\mysqldump.exe',
        ];

        foreach ($commonPaths as $path) {
            if (file_exists($path)) {
                return $path;
            }
        }

        // Try to find in PATH
        $process = new Process(['where', 'mysqldump']);
        try {
            $process->run();
            if ($process->isSuccessful()) {
                return trim($process->getOutput());
            }
        } catch (\Exception $e) {
            // Ignore errors
        }

        return null;
    }

    /**
     * Convert bytes to human readable format
     */
    private function getHumanFilesize(int $bytes, int $decimals = 2): string
    {
        $size = ['B', 'KB', 'MB', 'GB', 'TB', 'PB'];
        $factor = floor((strlen($bytes) - 1) / 3);
        return sprintf("%.{$decimals}f", $bytes / pow(1024, $factor)) . ' ' . $size[$factor];
    }
}
