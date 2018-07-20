<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\CustomerSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Customers';
$this->params['breadcrumbs'][] = $this->title;
?>
<script>
        function switchSysBar(){
            var switchPointid=document.getElementById("switchPoint");
            if (switchPointid.getAttribute("src")=="../web/img/hidden.gif"){
                switchPointid.src="../web/img/show.gif"
                document.all("customer_left").style.display="none"
            }else{
                switchPointid.src="../web/img/hidden.gif"
                document.all("customer_left").style.display=""
            }
        }
</script>
<div class="customer">
        <div class="customer_left" id="customer_left">
            <div class="customer_left_bt">
                    <div style="float:left;margin-left:8px;">
                        <span class="btn btn-green" type="button" style="width:105px;height:30px;margin-top:7px;">新建客户</span>
                        <span class="btn btn-green" type="button" style="width:105px;height:30px;margin-left:2px;margin-top:7px;">导入客户</span>
                    </div>
            </div>
            <div class="customer_left_search">
                <div style="margin-left:-80px;"><input style="margin-top:4px;" type="checkbox">在<span><我的客户></span>中搜索</div>
                <div style="float:left;margin-left:8px;margin-top:4px;">
                    <select>
                        <option>客户姓名</option>
                        <option>企业名称</option>
                        <option>电话号码1</option>
                        <option>电话号码2</option>
                    </select>
                </div>
                <div style="float:left;margin-top:4px;""><input type="text" style="width:80px;height:23px;"></div>
                <div style="float:left;margin-top:3px;"><button style="height:25px;" type="button">搜索</button></div>
                <div style="float:right;margin-top:5px;"><button style="margin-right:5px;">高级搜索</button></div>
            </div>
            <div class="customer_view">
                <div class="customer_view_title">
                    <span style="padding-top:3px;padding-left:3px;float:left;height:26px;line-height:26px;">数据视图&amp;工具</span>
                    <span class="btn btn-mini" title="添加修改视图">添加</span>
                    <span class="btn btn-mini" title="更新视图数据总数">更新</span></span>
                </div>
                <div class="customer_view_menu">
                    菜单显示
                </div>
            </div>
        </div>
        <div class="customer_x">
            <span><a href="#" onclick="switchSysBar()"><img id="switchPoint" src="../web/img/hidden.gif" style="width:4px; border:0px;" /></a></span>
        </div>
        <div class="customer_right">
            <div class="customer_lst">
                <div class="customer_lst_top"><span style="color:red;font-weight:bold;margin-top:8px;">我的客户</span></div>
                <div class="customer_lst_operating"><span><button>编辑</button><button>删除</button></span></div>
                <div class="customer-index">

                    <p>
                        <?= Html::a('Create Customer', ['create'], ['class' => 'btn btn-success']) ?>
                    </p>
                    <?= GridView::widget([
                        'dataProvider' => $dataProvider,
                        // 'filterModel' => $searchModel,
                        'columns' => [
                            // ['class' => 'yii\grid\SerialColumn'],

                            'id',
                            'cus_name',
                            'cus_sex',
                            'cus_phone1',
                            'cus_phone2',
                            // 'insert_time:datetime',
                            // 'update_time:datetime',
                            // 'client_resume',
                            // 'user_id',

                            ['class' => 'yii\grid\ActionColumn'],
                        ],
                    ]); ?>
                </div>
            </div>
        </div>
</div>     