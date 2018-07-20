<?php

namespace backend\models;

use Yii;

/**
 * This is the model class for table "customer".
 *
 * @property integer $id
 * @property string $cus_name
 * @property string $cus_sex
 * @property string $cus_phone1
 * @property string $cus_phone2
 * @property integer $insert_time
 * @property integer $update_time
 * @property string $client_resume
 * @property integer $user_id
 *
 * @property User $user
 */
class Customer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'customer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['insert_time', 'update_time'], 'required'],
            [['insert_time', 'update_time', 'user_id'], 'integer'],
            [['cus_name'], 'string', 'max' => 32],
            [['cus_sex'], 'string', 'max' => 2],
            [['cus_phone1', 'cus_phone2'], 'string', 'max' => 60],
            [['client_resume'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'cus_name' => '客户姓名',
            'cus_sex' => '性别',
            'cus_phone1' => '电话号码1',
            'cus_phone2' => '电话号码2',
            'insert_time' => '新建时间',
            'update_time' => '更新时间',
            'client_resume' => '最近备注',
            'user_id' => '所属座席',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
