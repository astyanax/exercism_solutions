<?php

class ProgramWindow
{
    public $x, $y, $width, $height;
    public function __construct(){
        $this->x = $this->y = 0;
        $this->width = 800;
        $this->height = 600;
    }
    public function resize(Size $size){
        $this->width = $size->width;
        $this->height = $size->height;
    }
    public function move(Position $pos){
        $this->x = $pos->x;
        $this->y = $pos->y;
    }
}
