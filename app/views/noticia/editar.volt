{% extends 'layouts/index.volt' %}

    {% block content %}

        <div id="cadastro_ticket" class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <i class="glyphicon glyphicon-plus"></i>
                        &nbsp;Editar Noticia
                    </div>
                    {{ form('noticias/salvar', 'method': 'post', 'enctype' : 'multipart/form-data', 'name':'cadastrar') }}
                        
                        <div class="panel-body">
                            <div class="col-md-12"  id="conteudo">
                                <div class="panel panel-default">
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="form-group col-sm-12">
                                                <p><strong>Data de Criação:</strong> {{ dataCadastro }}</p>
                                                <p><strong>Data da Última Atualização:</strong> {{data_ultima_atualizacao}}</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                               {{ hidden_field("id","class": 'form-control') }}

                                            <div class="form-group col-sm-12">
                                                <label for ="Titulo">Título <span class="error">(*)<span></label>
                                                {{ text_field("titulo","maxlength": '255', "width": '100%',"required": 'required', "class": 'form-control') }}
                                            </div>
                                        </div>
                                          <div class="row">
                                              <div class="form-group col-sm-12">
                                                  <label for ="Texto">Categorias</label>
                                                 {{select('categoria','class':'form-control',
                                                      listaCategoria
                                                 )}}
                                              </div>
                                          </div>
                                          <div class="row">
                                             <div class="form-group col-sm-12">
                                             <label for ="Texto">Categorias</label>
                                                	{% for item in categoriasSelecionadas %}
                                                        <div class="btn btn-success ">{{item.titulo}}</div>
                                                    {% endfor %}
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
            $(document).ready(function(){


            });
        </script>
    {% endblock %}
