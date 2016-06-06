<?php
namespace Condominio\Controller;

use Zend\Mvc\Controller\AbstractActionController;
use Zend\View\Model\ViewModel;
use Zend\Session\Container;
use Condominio\Model\Usuarios;
use Doctrine\ORM\ORMException;

/**
 * LoginController
 *
 * @author Rogerio Lamarques
 *
 * @version 1.0
 *
 */
class LoginController extends AbstractActionController
{
    public function indexAction()
    {
        $request = $this->getRequest();
                 
        if ($request->isPost()) {
            $dadosForm = $request->getPost()->toArray();
            try {
                $usuarios = new Usuarios();
                $usuarios->setUsuario($dadosForm['usuario']);
                $usuarios->setSenha($dadosForm['senha']);
                $em = $this->getServiceLocator()->get('Doctrine\ORM\EntityManager');
                if($em){
                    $dados = $em->getRepository('Condominio\Model\Usuarios')->findOneBy(array(
                        'usuario' => $usuarios->getUsuario(),
                        'senha'   => $usuarios->getSenha()
                    ));
                    $nDados = count($dados);
                    if ($nDados > 0) {
                        $sessao = new Container('Auth');
                        $sessao->id_usuarios = $dados->getIdUsuarios();
                        $sessao->usuario = $dados->getUsuario();
                        $sessao->admin = ($dados->getAdmin() == 1) ? true : false;
                        return $this->redirect()->toRoute('home');
                    } else {
                        return $this->redirect()->toRoute('login', array('action' => 'index'));
                    }
                }
            } catch (ORMException $e) {
                echo "<pre>";
                print_r($e);
                echo "<pre>";
                exit();
            }

        }
        return array(); 
//        $view =  new ViewModel();
//        return $view->setTerminal(true);
    }
    
    public function sairAction()
    {
        $sessao = new Container;
        $sessao->getManager()->getStorage()->clear();
        return $this->redirect()->toRoute('login');
    }
}