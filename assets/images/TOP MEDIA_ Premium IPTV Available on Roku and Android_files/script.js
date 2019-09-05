function utopia70_jsConfirm($id,$msg)
{
  var $obj=document.getElementById($id);
  if ( $obj.checked && !window.confirm($msg) ){
    $obj.checked=false;
  }
}
