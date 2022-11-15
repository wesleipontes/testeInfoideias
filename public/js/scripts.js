
$(document).ready(function(){/* jQuery toggle layout */
$('#btnToggle').click(function(){
  if ($(this).hasClass('on')) {
    $('#main .col-md-6').addClass('col-md-4').removeClass('col-md-6');
    $(this).removeClass('on');
  }
  else {
    $('#main .col-md-4').addClass('col-md-6').removeClass('col-md-4');
    $(this).addClass('on');
  }
});
});
// elementos
const select = document.querySelector('.select-addCategoria');
const option = document.querySelector('option');
const areaCategoria = document.querySelector('.addCate');

function addCategoria(e){
  if(e.key == 'Enter'){
    var categoria_id = select.value;
    var opcaoTexto = select.options[select.selectedIndex].text;
    areaCategoria.innerHTML += '<input type="hidden" id="'+categoria_id+'"> <div onclick="remove(event)" id="ctg'+categoria_id+'" class="btn border-radius btn-success">'+opcaoTexto+'</div> '
  }
}
select.addEventListener('keydown',addCategoria);

function remove(e) {
  var element = e.target;
  element.remove();
}











