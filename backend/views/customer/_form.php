<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\Customer */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="customer-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'cus_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cus_sex')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cus_phone1')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'cus_phone2')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'insert_time')->textInput() ?>

    <?= $form->field($model, 'update_time')->textInput() ?>

    <?= $form->field($model, 'client_resume')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
