<?php



use Phalcon\Mvc\Model;
use Phalcon\Paginator\Adapter\Model as Paginator;

class Noticiaa extends Model
{
    private $;
    private $nome;
    private $email;
    private $senha;

    public function initialize()
    {
        $this->setSource("noticia");
    }

    
}