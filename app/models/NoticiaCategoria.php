<?php

class NoticiaCategoria extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $id;

    /**
     *
     * @var integer
     */
    public $noticia_id;

    /**
     *
     * @var integer
     */
    public $categoria_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("phalcont_teste01");
        $this->setSource("Noticia_categoria");
        $this->belongsTo('categoria_id', 'Categoria', 'id', ['alias' => 'Categoria']);
        $this->belongsTo('noticia_id', 'Noticia', 'id', ['alias' => 'Noticia']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Noticia_categoria';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return NoticiaCategoria[]|NoticiaCategoria|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return NoticiaCategoria|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
