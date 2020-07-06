

<?php
        
       if(isset($_GET['Ordenar'])){

        $a=4;
        $b=9;
        $c=6;
        
        if($a>$b & $a>$c){
            if($b>$c){
                echo "xxx:".$a.$b.$c;
            }else{
                echo "xxx:".$a.$c.$b;
            }
        }else{
            echo "xxx:".$c.$a.$b;
        }


?>




