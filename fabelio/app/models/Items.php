<?php

Namespace App\Models;
use Phalcon\Mvc\Model;

class Items extends Model
{
    public $id;
    public $name;
    public $price;
    public $dimension;
    public $colours;
    public $material;
    public $image;

    public function onConstruct() {
    
    Model::setup(array(    
        'notNullValidations' => false
    ));
    }
 
}