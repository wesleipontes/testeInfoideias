{% extends 'layouts/index.volt' %}

    {%  block extrafooter %}
        <link href="{{ static_url("css/datatables.min.css") }}" rel="stylesheet">
    {% endblock %}

    {% block content %}
            <div class="row">
                <div class="col-md-12" id="conteudo">
                    <!-- <div class="col-md-6 col-sm-6"> -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <!-- <a href="#" class="pull-right">View all</a> -->
                                <span class="glyphicon glyphicon-tasks" aria-hidden="true"></span>
                                &nbsp;Notícias
                                <form class="navbar-form navbar-right" id="search_ticket" role="search">
                                    <div class="form-group">
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-search"></i></span>
                                            <input id="dataTableSearch" type="text" class="form-control" placeholder="Search">
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="panel-body">
                                <div class="col-md-12">
                                    <a id="button-abrir-ticket" href="{{ url(['for':'noticia.cadastrar']) }}" class="btn btn-primary"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Nova Noticia</a>
                                    
                                </div>
								<table id="lista-noticia" class="table dataTable table-hover">
									<thead>
										<tr>
											<td>Cod</td>
											<td>publicado</td>
											<td>Titulo</td>
											<td>Texto</td>
											<td>Ações</td>
										</tr>
									</thead>
									<tbody>
									{% for noticia in noticias %}

										<tr>
                                            <td><a class="idNoticia" href="#">{{noticia.id}}</a></td>
                                            <td><input onchange="publicacao(this)" class="form-check-input publicado" id="{{noticia.id}}" type="checkbox" data-id="{{noticia.publicado}}"></td>
                                            <td class="titulo"> {{noticia.titulo}}</td>
                                            <td class="text-center">{{noticia.texto}}</td>
                                            <td>
                                                <a href="{{ url(['for':'noticia.editar','id':noticia.id])}}"><span class="glyphicon glyphicon-pencil"></span></a>
                                                <a href="{{ url(['for':'noticia.excluir','id':noticia.id])}}"><span class="glyphicon glyphicon-remove-sign"></span></a>
                                            </td>
										</tr>
									{% endfor %}


									</tbody>
								</table>
                            </div><!-- panel-body -->
                        </div>
                </div>
            </div><!-- row -->

    {% endblock %}

    {%  block extrafooter %}
        

        <script>
        const checkbox = document.querySelector('.publicado');

        async function publicacao(element){
            let status = element.checked;
            let idNoticia = element.id
            let publicado = element.dataset.id;
               let url = '{{ url(['for':'noticia.salvar']) }}';
                let publicar = await fetch(url ,{
                    method: 'POST',
                    body: JSON.stringify({
                        publicado : publicado,
                        idNoticia : idNoticia
                    }),
                });
                     result = await publicar.json();

        }


            $(document).ready(function(){

                
            });
        </script>


    {% endblock %}