<?php

namespace Condominio\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;

use Condominio\Model\UnidadeModel;
use Condominio\Form\UnidadesForm;
use Condominio\Model\Unidades;

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

    public function addAction(){
        $form = new UnidadesForm();
        $form->get('salvar')->setValue('Salvar');

        $request = $this->getRequest();
        if($request->isPost()){
            $unidades= new Unidades();
            $form->setInputFilter($unidades->getInputFilter());
            $form->setData($request->getPost());

            if ($form->isValid()) {
                $unidades->exchangeArray($form->getData());
                /**
                 * @var  EntityManager
                 */
                $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
                $em->persist($unidades);
                return $this->redirect()->toRoute('unidades');
            }
        }
        return  new ViewModel(array(
            'form' => $form
        ));
    }
}