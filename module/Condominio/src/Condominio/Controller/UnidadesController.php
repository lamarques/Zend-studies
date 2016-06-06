<?php

namespace Condominio\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Condominio\Model\Unidades;
use Doctrine\ORM\ORMException;

class UnidadesController  extends AbstractActionController
{
    public function indexAction()
    {
        $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
        $dados = $em->getRepository('Condominio\Model\Unidades')->findAll();
        return  new ViewModel(array(
            'dados' => $dados
        ));
    }

    public function add(){
        return array();
    }
}