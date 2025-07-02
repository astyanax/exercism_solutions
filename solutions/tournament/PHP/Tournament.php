<?php
declare(strict_types=1);

class Tournament
{
    protected $scores;
    protected $matches = [];
    protected $reports = [];
    public function tally($scores)
    {
        $this->scores = $scores;
        $this->parseMatches();
        $this->calculateTeamReports();
        return $this->formatScoreBoard();
    }

    protected function parseMatches()
    {
        if (empty($this->scores)) return;
        foreach (explode(PHP_EOL, $this->scores) as $score) {
            list($team1, $team2, $result) = explode(';', $score);
            $this->matches[] = new TournamentMatch($team1, $team2, $result);
        }
    }

    protected function getTeamReport($team)
    {
        if (!array_key_exists($team, $this->reports)) {
            $this->reports[$team] = new TournamentTeamReport($team);
        }
        return $this->reports[$team];
    }

    protected function calculateTeamReports()
    {
        foreach ($this->matches as $match) {
            $reportTeam1 = $this->getTeamReport($match->team1());
            $reportTeam2 = $this->getTeamReport($match->team2());
            switch (strtolower($match->result())) {
                case 'win':
                    $reportTeam1->win();
                    $reportTeam2->lose();
                    break;
                case 'loss':
                    $reportTeam1->lose();
                    $reportTeam2->win();
                    break;
                default: // draw
                    $reportTeam1->draw();
                    $reportTeam2->draw();
                    break;
            }
            $this->reports[$match->team1()] = $reportTeam1;
            $this->reports[$match->team2()] = $reportTeam2;
        }
    }

    protected function formatScoreBoard()
    {
        $scoreBoard = 'Team                           | MP |  W |  D |  L |  P' . PHP_EOL;
        uasort($this->reports, function ($a, $b) {
            if ($a->points() === $b->points()) {
                return $a->team() < $b->team() ? -1 : 1; // asc
            }
            return $a->points() < $b->points() ? 1 : -1; // desc
        });
        $separator = str_pad('|', 3);
        foreach ($this->reports as $report) {
            $scoreBoard .= str_pad($report->team(), 31) . $separator .
                           str_pad((string) $report->played(), 2) . $separator .
                           str_pad((string) $report->wins(), 2) . $separator .
                           str_pad((string) $report->draws(), 2) . $separator .
                           str_pad((string) $report->losses(), 2) . $separator .
                           $report->points() . PHP_EOL;
        }
        return trim($scoreBoard);
    }
}
class TournamentMatch
{
    protected $team1;
    protected $team2;
    protected $result;
    public function __construct($team1, $team2, $result)
    {
        $this->team1 = $team1;
        $this->team2 = $team2;
        $this->result = $result;
    }

    public function team1()
    {
        return $this->team1;
    }

    public function team2()
    {
        return $this->team2;
    }

    public function result()
    {
        return $this->result;
    }
}
class TournamentTeamReport
{
    protected $team;
    protected $played = 0;
    protected $wins = 0;
    protected $draws = 0;
    protected $losses = 0;
    protected $points = 0;
    public function __construct($team)
    {
        $this->team = $team;
    }

    public function team()
    {
        return $this->team;
    }

    public function played()
    {
        return $this->played;
    }

    public function wins()
    {
        return $this->wins;
    }

    public function draws()
    {
        return $this->draws;
    }

    public function losses()
    {
        return $this->losses;
    }

    public function points()
    {
        return $this->points;
    }

    public function win()
    {
        $this->played += 1;
        $this->wins += 1;
        $this->points += 3;
    }

    public function lose()
    {
        $this->played += 1;
        $this->losses += 1;
        $this->points += 0;
    }

    public function draw()
    {
        $this->played += 1;
        $this->draws += 1;
        $this->points += 1;
    }
}