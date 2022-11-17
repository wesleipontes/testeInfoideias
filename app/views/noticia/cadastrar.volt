{% extends 'layouts/index.volt' %}

    {% block content %}

        <div id="cadastro_ticket" class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="glyphicon glyphicon-plus"></i>
                        &nbsp;Cadatrar Notícia
                    </div>
                    {{ form('noticias/salvar', 'method': 'post', 'enctype' : 'multipart/form-data', 'name':'cadastrar') }}
                        <div class="panel-body">
                            <div class="col-md-12"  id="conteudo">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Titulo">Título <span class="error">(*)<span></label>
                                                {{ text_field("titulo","maxlength": '255', "width": '100%',"required": 'required', "class": 'form-control') }}
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Texto">Categorias</label>
                                               {{select('categoria', 'class':'select-addCategoria form-control',
                                                   listaCategoria
                                               )}}
                                                <small id="helpId" class="text-muted">Aperte enter para adicionar mais de uma categoria</small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="addCate form-group col-sm-12">

                                            </div>
                                        </div>

                                         <div class="row">
                                            <div class="form-group col-sm-12">
                                                <label for ="Texto">Texto</label>
                                                {{ text_area("texto", "class": 'form-control tinymce-editor') }}
                                            </div>
                                        </div>
                                    </div>{#/.panel-body#}
                                </div>{#/.panel#}
                                <div class="row" style="text-align:right;">
                                    <div id="buttons-cadastro" class="col-md-12">
                                        <a href="{{ url(['for':'noticia.lista']) }}" class="btn btn-default">Cancelar</a>
                                        {{ submit_button('Gravar', "class": 'btn btn-primary') }}
                                    </div>
                                </div>
                            </div>{#/.conteudo#}
                        </div>{#/.panel-body#}
                    {{ end_form() }}
                </div>{#/.panel#}
            </div>{#/.col-md-12#}
        </div><!-- row -->

    {% endblock %}

    {%  block extrafooter %}
        
        <script>
        const select = document.querySelector('.select-addCategoria');
        const option = document.querySelector('option');
        const areaCategoria = document.querySelector('.addCate');

        function addCategoria(e){
          if(e.key == 'Enter'){
            var categoria_id = select.value;
            var opcaoTexto = select.options[select.selectedIndex].text;
            areaCategoria.innerHTML += ' <div onclick="remove(event)" id="ctg'+categoria_id+'" class="btn border-radius btn-success"><input type="hidden" id="categoriaSelecionada" name="categoriaSelecionada[]" value="'+categoria_id+'"> '+opcaoTexto+'</div> '
          }
        }
        select.addEventListener('keydown',addCategoria);

        function remove(e) {
          var element = e.target;
          element.remove();
        }




            $(document).ready(function(){


            });
        </script>
    {% endblock %}














