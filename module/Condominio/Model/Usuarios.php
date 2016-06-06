<?php
namespace Condominio\Model;

use Doctrine\ORM\Mapping as ORM;
/**
 * @ORM\Entity
 */
class Usuarios
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue("AUTO")
     * @ORM\Column(type="integer")
     */
    private $id_usuarios;
    /**
     * @ORM\Column(type="string", length=100)
     */
    private $usuario;
    /**
     * @ORM\Column(type="string", length=64)
     */
    private $senha;
    /**
     * @ORM\Column(type="integer")
     */
    private $admin;

    /**
     *
     * @return int
     */
    public function getIdUsuarios()
    {
        return $this->id_usuarios;
    }

    /**
     *
     * @param string $id_usuarios            
     */
    public function setIdUsuarios($id_usuarios)
    {
        $this->id_usuarios = $id_usuarios;
        return $this;
    }

    /**
     *
     * @return string
     */
    public function getUsuario()
    {
        return $this->usuario;
    }

    /**
     *
     * @param string $usuario            
     */
    public function setUsuario($usuario)
    {
        $this->usuario = $usuario;
        return $this;
    }

    /**
     *
     * @return the unknown_type
     */
    public function getSenha()
    {
        return $this->senha;
    }

    /**
     *
     * @param unknown_type $senha            
     */
    public function setSenha($senha)
    {
        $this->senha = md5($senha);
        return $this;
    }

    /**
     *
     * @return int
     */
    public function getAdmin()
    {
        return $this->admin;
    }

    /**
     *
     * @param int $admin            
     */
    public function setAdmin($admin)
    {
        $this->admin = $admin;
        return $this;
    }
 
    
    
 
    
    
}
