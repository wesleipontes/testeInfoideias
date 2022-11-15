<?php

class Noticia extends \Phalcon\Mvc\Model
{
    public function initialize()
    {
        $this->setSource("noticia");
        $this->hasManyToMany('id','NoticiaCategoria','noticia_id',
            'categoria_id','categoria','id',['alias' => 'Categoria']);
    }

    public $id;
    public $titulo;
    public $texto;
    public $data_ultima_atualizacao;
    public $data_cadastro;

     public function getSource()
    {
        return 'Noticia';
    }
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
