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
                $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
                $em->persist($unidades);
                $em->flush($unidades);
                return $this->redirect()->toRoute('unidades');
            }
        }
        return  new ViewModel(array(
            'form' => $form
        ));
    }
    
    public function editAction(){
        $id_unidades = $this->params()->fromRoute('id', 0);
        $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
        $form = new UnidadesForm();
        $data = array();
        $data['dados'] = array();
        $form->get('salvar')->setValue('Salvar');
        
        $request = $this->getRequest();
        if($request->isPost()){
            $unidades= $em->getRepository('Condominio\Model\Unidades')->find($id_unidades);;
            $form->setInputFilter($unidades->getInputFilter());
            $form->setData($request->getPost());
        
            if ($form->isValid()) {
                $unidades->exchangeArray($form->getData());
                $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
                $em->merge($unidades);
                $em->flush($unidades);
                return $this->redirect()->toRoute('unidades');
            }
        } else {
            $unidades = $em->getRepository('Condominio\Model\Unidades')->find($id_unidades);
            $id_unidades = $this->params()->fromRoute('id', 0);
            $unidades->setIdUnidades($id_unidades);
        }
        $data['dados'] =  $unidades;
        $data['form'] = $form;
        return  new ViewModel($data);
    }
    
    public function deleteAction(){
        $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
        $id_unidades = $this->params()->fromRoute('id', 0);
        $unidades = $em->getRepository('Condominio\Model\Unidades')->find($id_unidades);
        if($unidades){
            $em->remove($unidades);
            $em->flush();
        }
        return $this->redirect()->toRoute('unidades');
    }
}