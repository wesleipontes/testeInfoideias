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

        $categoriasLista = Categoria::find();
        $listaCategoria=[];
        $id=1;
        foreach ($categoriasLista as $item){
            $listaCategoria[$id]= $item->titulo;
            $id++;
        }
        $this->view->listaCategoria=$listaCategoria;
        $this->view->pick("noticia/cadastrar");

    }

    public function editarAction($id)
    {
        $noticia = Noticia::findFirstByid($id);
        if (!$noticia) {
            $this->flash->error("Noticia não encontrada!");
            $this->response->redirect(['for' => 'noticia.lista']);

            return;
        }
        $categoriasLista = Categoria::find();
        $listaCategoria=[];
        $id=1;
        foreach ($categoriasLista as $item){
            $listaCategoria[$id]= $item->titulo;
            $id++;
        }
        $this->view->listaCategoria=$listaCategoria;// enviando a lista de categoria para tela editar
        $this->view->dataCadastro = $noticia->data_cadastro;
        $this->view->data_ultima_atualizacao = $noticia->data_ultima_atualizacao;
        $this->tag->setDefault("id", $noticia->id);
        $this->tag->setDefault("titulo", $noticia->titulo);
        $this->tag->setDefault("texto", $noticia->texto);

        //$noticiaCategoria = NoticiaCategoria::find('noticia_id',$id);
        $this->view->categoriasSelecionadas=$noticia->categoria;

        $this->view->pick("noticia/editar");
    }

    public function salvarAction()
    {

        if($this->request->isPost()){

            if($this->request->getPost('id')){
                $noticia = Noticia::findFirst($this->request->getPost('id'));
                $noticia->titulo = $this->request->getPost('titulo');
                $noticia->texto = $this->request->getPost('texto');
                $noticia->data_ultima_atualizacao = date("Y/m/d h:i:s A");

                if(!$noticia->save()){
                    foreach ($noticia->getMessages() as $message){
                        $this->flash->error($message->getMessage());
                    }
                    $this->dispatcher->forward(['controller'=>'Noticia', 'action'=>'cadastrar']);
                    return;
                }


                $this->flash->success('Noticia Atualizada Com Sucesso!');
                $this->dispatcher->forward(['controller'=>'Noticia', 'action'=>'lista']);


            }else{

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


                $categoriasSelecionada= $this->request->getPost('categoriaSelecionada');
                foreach ($categoriasSelecionada as $item){
                    $noticiaCategoria = new NoticiaCategoria();
                    $noticiaCategoria->categoria_id = $item;
                    $noticiaCategoria->noticia_id = $noticia->id;
                    $noticiaCategoria->save();
                }

                //return print_r($noticia);
                $this->flash->success('Noticia Salva Com Sucesso!');
                $this->dispatcher->forward(['controller'=>'Noticia', 'action'=>'lista']);
            }
        }
        $this->dispatcher->forward(['controller'=>'Noticia', 'action'=>'lista']);
        //return $this->response->redirect(array('for' => 'noticia.lista'));
    }

     public function excluirAction($id)
     {
         $noticia = Noticia::findFirst($id);
         if($noticia){
             $noticia->delete();
         }
        return $this->response->redirect(array('for' => 'noticia.lista'));
     }

}