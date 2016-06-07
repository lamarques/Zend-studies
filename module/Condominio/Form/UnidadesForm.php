<?php

namespace Condominio\Form;

use Zend\Form\Form;

class UnidadesForm extends Form
{

    public function __construct($name = null)
    {
        parent::__construct('unidades');

        $this->add(array(
            'name' => 'id_unidades',
            'type' => 'Hidden'
        ));

        $this->add(array(
            'name' => 'unidade',
            'type' => 'Text',
            'options' => array(
                'label' => 'Unidade',
            ),
        ));

        $this->add(array(
            'name' => 'vagas',
            'type' => 'Text',
            'options' => array(
                'label' => 'Vagas'
            )
        ));

        $this->add(array(
            'name' => 'local',
            'type' => 'Text',
            'options' => array(
                'label' => 'Local'
            )
        ));

        $this->add(array(
            'name' => 'ocupado',
            'type' => 'Checkbox',
            'options' => array(
                'label' => 'Unidade Ocupada'
            )
        ));

        $this->add(array(
            'name' => 'alugado',
            'type' => 'Checkbox',
            'options' => array(
                'label' => 'Unidade Alugada'
            )
        ));

        $this->add(array(
            'name' => 'salvar',
            'type' => 'Submit',
            'attributes' => array(
                'value' => 'Salvar',
                'id' => 'submitbutton',
            ),
        ));
    }

}