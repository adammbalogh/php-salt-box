<?php
//phpinfo();

class A {
    private $prop = "hello";
    public function getProp() {
        return $this->prop;
    }
}

$a = new A();
echo $a->getProp(), "\n";