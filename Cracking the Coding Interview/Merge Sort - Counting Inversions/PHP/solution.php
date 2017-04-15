<?php
    function countSwaps(&$arr) {
        $len = count($arr);
        if (!$len || $len==1)
            return 0;
        $mid = round($len/2);
        $arrA = array_slice($arr, 0, $mid);
        $arrB = array_slice($arr, $mid);
        $count = countSwaps($arrA) + countSwaps($arrB);
        $arr = array();
        $i = 0;
        $j = 0;
        while ($i<$mid || $j<$len-$mid) {
            if ($i==$mid) {
                $arr = array_merge($arr, array_slice($arrB, $j));
                break;
            }
            if ($j==($len-$mid)) {
                $arr = array_merge($arr, array_slice($arrA, $i));
                break;
            }
            if ($arrA[$i]<=$arrB[$j]) {
                $arr[] = $arrA[$i];
                $i++;
            } else {
                $arr[] = $arrB[$j];
                $j++;
                $count += $mid - $i;
            }
        }
        return $count;
    }

    $handle = fopen ("php://stdin","r");
    fscanf($handle,"%d",$t);
    for($a0 = 0; $a0 < $t; $a0++){
        fscanf($handle,"%d",$n);
        $arr_temp = trim(fgets($handle));
        $arr = explode(" ",$arr_temp);
        array_walk($arr,'intval');
        $count = countSwaps($arr, 0, count($arr));
        echo "$count\n";
    }
?>
