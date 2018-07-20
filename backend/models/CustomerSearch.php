<?php

namespace backend\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Customer;

/**
 * CustomerSearch represents the model behind the search form about `backend\models\Customer`.
 */
class CustomerSearch extends Customer
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'insert_time', 'update_time', 'user_id'], 'integer'],
            [['cus_name', 'cus_sex', 'cus_phone1', 'cus_phone2', 'client_resume'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Customer::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'insert_time' => $this->insert_time,
            'update_time' => $this->update_time,
            'user_id' => $this->user_id,
        ]);

        $query->andFilterWhere(['like', 'cus_name', $this->cus_name])
            ->andFilterWhere(['like', 'cus_sex', $this->cus_sex])
            ->andFilterWhere(['like', 'cus_phone1', $this->cus_phone1])
            ->andFilterWhere(['like', 'cus_phone2', $this->cus_phone2])
            ->andFilterWhere(['like', 'client_resume', $this->client_resume]);

        return $dataProvider;
    }
}
