<?php
declare(strict_types=1);

namespace App\Controllers;
use App\Models\Items;

class IndexController extends ControllerBase
{
    public function _registerSession($items)
    {
        $this->session->set(
            'sorted',
            $items
        );
    }

    public function _registerCookies($cur)
    {
        $this->cookies->set(
            'cookie',
            (string)$cur,
            time() + 360 * 84600
        );
    }

    public function indexAction()
    {  
        // Sorting Items
        if (!$this->session->has("sorted"))
        {
            $solditem = Items::findFirst();
            $items = Items::find();
            
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
    
            $this->_registersession($itemsSorted);
        }

        // Cookie Cek
        if ($this->cookies->has("cookie")) 
        {
            $itemsSorted = $this->session->get('sorted');
            $sum = count($itemsSorted);

            $cur = (int)$this->cookies->get('cookie')->getValue() + 1;
            if($cur >= $sum) $cur = 1;

            $this->_registerCookies($cur);
        }
        else
        {
            $this->_registerCookies(1);
        }
        $this->view->cok = "halo";

        $itemsSorted = $this->session->get('sorted');
        $cur = $this->cookies->get('cookie')->getValue();

        $this->view->item = $itemsSorted[$cur];
        $this->view->cur = $cur;
    }

}

