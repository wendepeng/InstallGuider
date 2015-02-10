<?php
@include '../config.php';
$configFilePath='../config.php';
$sqlFilePath='./install.sql';
$licenceFilePath='./licence.txt';

error_reporting(7);
set_magic_quotes_runtime(0);
define('CCVITA_ROOT', TRUE);
require 'mysql.php';

if(!get_magic_quotes_gpc()) {
    $_GET=array_map("addslashes",$_GET);
    $_POST=array_map("addslashes",$_POST);
}

if(function_exists('set_time_limit') == 1 && @ini_get('safe_mode') == 0) {
    @set_time_limit(1000);
}

$action = ($_POST['action']) ? $_POST['action'] : $_GET['action'];
$PHP_SELF = $_SERVER['PHP_SELF'] ? $_SERVER['PHP_SELF'] : $_SERVER['SCRIPT_NAME'];
$fp = fopen('./install.sql', 'rb');
$sql = fread($fp, 2048000);
fclose($fp);

function runquery($sql) {
	global $dbcharset, $prefix, $db;

	$sql = str_replace("\r", "\n",$sql);
	$ret = array();
	$num = 0;
	foreach(explode(";\n", trim($sql)) as $query) {
		$queries = explode("\n", trim($query));
		foreach($queries as $query) {
			$ret[$num] .= $query[0] == '#' ? '' : $query;
		}
		$num++;
	}
	unset($sql);

	foreach($ret as $query) {
		$query = trim($query);
		if($query) {
			if(substr($query, 0, 12) == 'CREATE TABLE') {
				$name = preg_replace("/CREATE TABLE ([a-z0-9_]+) .*/is", "\\1", $query);
				echo '表'.$name.' ... <font color="#0000EE">创建成功</font><br />';
				$db->query(createtable($query, $dbcharset));
			} else {
				$db->query($query);
			}
		}
	}
}

function createtable($sql, $dbcharset) {
	$type = strtoupper(preg_replace("/^\s*CREATE TABLE\s+.+\s+\(.+?\).*(ENGINE|TYPE)\s*=\s*([a-z]+?).*$/isU", "\\2", $sql));
	$type = in_array($type, array('MYISAM', 'HEAP')) ? $type : 'MYISAM';
	return preg_replace("/^\s*(CREATE TABLE\s+.+\s+\(.+?\)).*$/isU", "\\1", $sql).
		(mysql_get_server_info() > '4.1' ? " ENGINE=$type DEFAULT CHARSET=$dbcharset" : " TYPE=$type");
}

function readover($filename,$method="rb"){
   if($handle=@fopen($filename,$method)){
      flock($handle,LOCK_SH);
      $filedata=@fread($handle,filesize($filename));
      fclose($handle);
   }
   return $filedata;
}

function file_write($file,$content){
   if(@file_exists($file) && !is_writable($file)){
       chmod($file, 0777) or die("Cannot change the mode of file ".$file);
   }
   $fp = @fopen($file, "w") or die("Cannot open file ".$file);
   fwrite($fp,$content) or die("Cannot write to file ".$file);
   fclose($fp) or die("Cannot close file ".$file);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="zh-CN" lang="zh-CN">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-language" content="zh-CN" />
<title>Installation </title>
<link rel="stylesheet" type="text/css" media="screen" href="../skin/default/images/ccvita.css" />
</head>

<style type="text/css">
table {vertical-align: top;background-color: #f0f0f0;}
</style>
<body vlink='#000000' link='#000000' bgcolor='#6A71A3' leftmargin=0 topmargin=5 marginwidth="0" marginheight="0">
 <table cellspacing="0">
    <tr>
	<td id="centercolumn">
	 <div id="content">
<a href="http://www.baidu.com"><?php echo $appname ?></a>&nbsp;<span style="font-weight:bold;">&raquo;&raquo;</span>&nbsp; Installation<br /><br />
<table width="100%" border="0" cellspacing="5">
  <tr valign="top">
    <td width="80%">
   	  <table class="outer" cellpadding="4" cellspacing="1" width="100%">
       
     
      
       
<?php

if(!$action){
    $bxcms_licence = readover($licenceFilePath);
    $bxcms_licence = str_replace('  ', '&nbsp; ', nl2br($bxcms_licence));

?>		 <tr>
          <th colspan="2" align="center">声明</th>
        </tr>
        <tr>
          <td class="even"><span style="font-weight:bold;">&raquo;</span><B><font color="#000000">请认真阅读以下文字</font></b></td>
        </tr>
        <tr>
          <td class='odd'><br>
          <?php echo $bxcms_licence?>
          </td>
        </tr>
        <tr>
          <td align="center" class="even">
            <br>
            <form method="post" action="<?php echo $PHP_SELF?>">
              <input type="hidden" name="action" value="config" >
              <input type="submit" name="submit" value="同意">&nbsp;
              <input type="button" name="exit" value="不同意" onclick="javascript: window.close();">
            </form>
          </td>
        </tr>
<?php

} elseif($action == 'config'){
        $exist_error = FALSE;
        $write_error = FALSE;
        $correct='......<font color="#0000EE">OK</font>';
        $incorrect=' <font color="#FF0000">文件不存在或者权限不足</font>';
        $w_check=array($configFilePath);
        $count=count($w_check);
        for($i=0; $i<$count; $i++) {
            if(!file_exists($w_check[$i])){
                $w_check[$i].= $incorrect;
                $exist_error=TRUE;
            } elseif(is_writable($w_check[$i])){
              $w_check[$i].= $correct;
            } else {
              $w_check[$i].=$incorrect;
              $exist_error=TRUE;
            }
        }
?>
		 <tr style="display:none">
          <td class="odd"><span style="font-weight:bold;">&raquo;</span>检查文件权限</td>
        </tr>
		 <tr style="display:none">
          <td class="even"><span style="font-weight:bold;">&raquo;</span> <?php foreach($w_check as $tmp)echo $tmp."<br>\n";?></td>
        </tr>
        <tr style="display:none">
         <td class='odd'>
          <span style="font-weight:bold;">&raquo;</span>
         </td>
        </tr>
<?php
  if(!$exist_error && !$write_error){
      if(dirname($PHP_SELF)!="\\")$path=dirname($PHP_SELF);
      else $path='';
      $getrootpath = "http://".$_SERVER['HTTP_HOST'].$path;
?>
        <tr>
        <form method="post" action="<?php echo $PHP_SELF?>">
         <td align=center>
         <table width="50%" cellspacing=0 cellpadding=1 align=center>
          <tr><td>
           <table width="100%" cellspacing=1 cellpadding=3 align=center>
            <tr><th colspan="2"><font color="#FFFFFF">数据库配置</font></td></tr>
            <tr valign='top' align='left'>
             <td class='head' width='40%'>&nbsp;&nbsp;数据库服务器地址</td>
             <td class='even'><input type='text' name='servername' value='<?php echo $servername;?>'></td>
            </tr>
            <tr valign='top' align='left'>
             <td class='head'>&nbsp;&nbsp;数据库用户名</td>
             <td class='even'><input type='text' name='dbusername' value='<?php echo $dbusername;?>'></td>
            </tr>
            <tr valign='top' align='left'>
             <td class='head'>&nbsp;&nbsp;数据库密码</td>
             <td class='even'><input type='text' name='dbpassword' value='<?php echo $dbpassword;?>'></td>
            </tr>
            <tr valign='top' align='left'>
             <td class='head'>&nbsp;&nbsp;数据库名</td>
             <td class='even'><input type='text' name='dbname' value='<?php echo $dbname;?>'></td>
            </tr>
            <tr valign='top' align='left' style="display:none">
             <td class='head'>&nbsp;&nbsp;表前缀</td>
             <td class='even'><input type='text' name='prefix' value='<?php echo $prefix;?>'></td>
            </tr>
            <tr valign='top' align='left' style="display:none">
             <td class='head'>&nbsp;&nbsp;系统根目录网址</td>
             <td class='even'><input type='text' name='rootpath' value='<?php echo $getrootpath?>'></td>
            </tr>
           </table>
          </td></tr>
         </table>
        </td>
        </tr>
        <tr>
         <td align="center">
          <br>
          <input type="hidden" name="action" value="environment">
          <input type="hidden" name="saveconfig" value="1">
          <input type="button" name="exit" value="上一步" style="height: 25" onclick="javascript: history.go(-1);">
          <input type="submit" name="submit" value="下一步" style="height: 25">
          <br><br>
         </td>
        </form>
        </tr>
<?php
  } else {
?>
        <tr>
          <td align="center">
            <br>
            <form method="post" action="<?php echo $PHP_SELF?>">
              <input type="hidden" name="action" value="config">
              <input type="submit" name="submit" value="重新填写" style="height: 25">
              <input type="button" name="exit" value="退出" style="height: 25" onclick="javascript: window.close();">
            </form>
          </td>
        </tr>
<?php
  }

} elseif($action == 'environment'){
         if($_POST['saveconfig']){
            $database = $_POST['database'];
            $servername = $_POST['servername'];
            $dbusername = $_POST['dbusername'];//str_replace('$','\\$',$_POST['dbusername']);
            $dbpassword = $_POST['dbpassword'];//str_replace('$','\\$',$_POST['dbpassword']);
            $dbname = $_POST['dbname'];
            $prefix = $_POST['prefix'];
         }
?>
	
        <tr>
          <td align="center">
            <table width="70%" cellspacing=0 cellpadding=1 align=center>
             <form method="post" action="<?php echo $PHP_SELF?>">
             <tr><td>
              <table width="100%" cellspacing=1 cellpadding=3 align=center>
			  <tr><th colspan="2"><font color="#FFFFFF">后台设置</font></td></tr>
               <tr>
                <td class='head'align='left'>&nbsp;&nbsp;用户名:</td>
                <td class='even'align='left'><input type='text' name='username' value='admin'></td>
               </tr>
               <tr>
                <td class='head'align='left'>&nbsp;&nbsp;密码:</td>
                <td class='even'align='left'><input type='text' name='password1'></td>
               </tr>
               <tr>
                <td class='head'align='left'>&nbsp;&nbsp;确认密码:</td>
                <td class='even'align='left'><input type='text' name='password2'></td>
               </tr>
               <tr>
                <td class='head'align='left'>&nbsp;&nbsp; Email:</td>
                <td class='even'align='left'><input type='text' name='email' value='name@domain.com'></td>
               </tr>
              </table>
             </td></tr>
             <tr><td align="center"><br>
              <input type="hidden" name="action" value="install">
              <input type="button" name="exit" value="上一步" style="height:25" onclick="javascript: history.back();">
              <input type="submit" name="submit" value="安装" style="height:25">
            </form>
            </table>
          </td>
        </tr>
<?php

} elseif($action == 'install'){
		$username = $_POST['username'];
		$email = $_POST['email'];
		$password1 = $_POST['password1'];
		$password2 = $_POST['password2'];

    $msg = '';
    if($username && $email ){
       if($password1 != $password2) {
          $msg = "密码不一致";
       } elseif(!strstr($email, '@') || $email != stripslashes($email) || $email != htmlspecialchars($email)) {
         $msg = "Email 格式不正确";
       }
    } 
    else 
      $msg = '请将信息填写完整';

  if($msg){
  ?>
           <font color="#FF0000">错误：<?php echo $msg?></font></td>
          </tr>
          <tr>
            <td align="center" class='odd'>
              <br>
              <input type="button" name="back" value="上一步" onclick="javascript: history.go(-1);">
              <br><br>
            </td>
          </tr>

  <?php
    } else {
  	$db = new DB_MySQL;
  	$db->connect($servername, $dbusername, $dbpassword, $dbname, $usepconnect);
  	unset($servername, $dbusername, $dbpassword, $usepconnect);
  	runquery($sql);
    $pwd=md5($password1);
    $db->unbuffered_query("UPDATE ".$prefix."user SET password = '".$pwd."' WHERE `userid` =1");
  ?>
         <br></td>
        </tr>
        <tr class='odd'>
          <td><?php echo $installinfo?></td>
        </tr>
        <tr class='even'>
          <td align="center">
            <font color="#0000EE"><b>程序安装成功！</font><br>
            <font color="#0000EE">管理员账号：</b><?php echo $username?>密码：<?php echo $password1?></font><br>
            <font color="#FF0000">请删除install文件夹以免重新安装</font><br>
          </td>
        </tr>
<?php
  }
}

?>
           </table>
    </td>
  </tr>
</table>
        </div></td> </tr>
  </table>

<table cellspacing="0">
    <tr id="footerbar">
      <td>Powered by 
    </tr>
  </table>
</body>
</html>