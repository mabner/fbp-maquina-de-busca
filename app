#!/usr/bin/php
<?php
require 'vendor/autoload.php';
use Symfony\Component\Console\Application;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use App\Engine\Wikipedia\WikipediaEngine;
use App\Engine\Wikipedia\WikipediaParser;
use Symfony\Component\HttpClient\HttpClient;

class GreetCommand extends Command
{
    protected function configure()
    {
        $this
            ->setName('greet')
            ->setDescription('Greet the given person name')
            ->addArgument('name', InputArgument::REQUIRED, 'The person name');
    }
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $output->writeln('Olá ' . $input->getArgument('name'));
        return 0;
    }
}

$wikipedia = new WikipediaEngine(new WikipediaParser(), HttpClient::create());
$result = $wikipedia->search('php');
$app = new Application();
$app->add(new GreetCommand());
$app->run();

var_dump($result);
