<?php


class NoticiaController extends ControllerBase
{
    private $mensagemDeErro = '';

    public function listaAction()
    {
        $noticias =  Noticia::find();
        $this->view->noticias=$noticias;

        $this->view->pick("noticia/listar");
    }

    public function cadastrarAction()
    {
        
        $this->view->pick("noticia/cadastrar");

    }

    public function editarAction($id)
    {
        $this->view->pick("noticia/editar");
    }

    public function salvarAction()
    {
        if($this->request->isPost()){
            //$data = new DateTime('now');
            $noticia = new Noticia();
            $noticia->titulo= $this->request->getPost('titulo');
            $noticia->texto= $this->request->getPost('texto');
            $noticia->data_cadastro = date("Y/m/d h:i:s A");
            $noticia->data_ultima_atualizacao = date("Y/m/d h:i:s A");
            if(!$noticia->save()){
                foreach ($noticia->getMessages() as $message){
                    $this->flash->error($message->getMessage());
                }
                $this->dispatcher->forward(['controller'=>'Noticia', 'action'=>'cadastrar']);
                return;
            }
            $this->flash->success('Noticia Salva Com Sucesso!');
            $this->dispatcher->forward(['controller'=>'Noticia', 'action'=>'lista']);

        }
        //return $this->response->redirect(array('for' => 'noticia.lista'));
    }

     public function excluirAction($id)
     {
        return $this->response->redirect(array('for' => 'noticia.lista'));
     }

}