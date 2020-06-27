<?php
declare(strict_types=1);

namespace App\Controllers;
use App\Models\Items;

class IndexController extends ControllerBase
{
    public function _registerSession($items, $sum, $cur)
    {
        $this->session->set(
            'sorted',
            [
                'items'  => $items,
                'sum'    => $sum,
                'cur'    => $cur
            ]
        );
    }

    public function indexAction()
    {
        if ($this->session->has('sorted')) {
            $itemsSorted = $this->session->get('sorted');

            $cur = $itemsSorted['cur'] + 1;
            if($cur >= $itemsSorted['sum']) $cur = 0;

            $this->_registerSession($itemsSorted['items'], $itemsSorted['sum'], $cur);
        }
        else
        {
            $solditem = Items::findFirst();
            $items = Items::find();
            $sum = count($items);
            
            $itemsSorted = array();
            foreach ($items as $item)
            {
                $tmp = similar_text($solditem->name, $item->name, $percent);
                $nameSim = $percent;
    
                $tmp = similar_text($solditem->name, $item->name, $percent);
                $colourSim = $percent*0.5;
    
                $tmp = similar_text($solditem->dimension, $item->dimension, $percent);
                $dimensionSim = $percent*0.2;
    
                $tmp = similar_text($solditem->material, $item->material, $percent);
                $materialSim = $percent*0.1;
    
                $val = $nameSim + $colourSim + $dimensionSim + $materialSim;
                array_push($itemsSorted, array($val, $item));
            }
    
            rsort($itemsSorted);
    
            $this->_registerSession($itemsSorted, $sum, 0);
        }

            $sesi = $this->session->get('sorted');
            $items = $sesi['items'];

            $this->view->item = $items[$cur];
    }

}

