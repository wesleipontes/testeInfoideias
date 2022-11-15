<?php

class Categoria extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var string
     */
    public $titulo;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("phalcont_teste01");
        $this->setSource("Categoria");
        $this->hasManyToMany('id','NoticiaCategoria','categoria_id',
        'Noticia_id','Noticia','id');
        //$this->belongsTo('categoria_id', 'Categoria', 'id', ['alias' => 'Categoria']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Categoria';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Categoria[]|Categoria|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Categoria|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
