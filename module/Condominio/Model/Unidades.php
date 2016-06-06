<?php
namespace Condominio\Model;

use Doctrine\ORM\Mapping as ORM;
/**
 * @ORM\Entity
 */
class Unidades
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue("AUTO")
     * @ORM\Column(type="integer")
     */
    private $id_unidades;
    /**
     * @ORM\Column(type="string", length=45)
     */
    private $unidade;
    /**
     * @ORM\Column(type="integer")
     */
    private $vagas;
    /**
     * @ORM\Column(type="string", length=255)
     */
    private $local;
    /**
     * @ORM\Column(type="integer")
     */
    private $ocupado;
    /**
     * @ORM\Column(type="integer")
     */
    private $alugado;

    /**
     * @return integer
     */
    public function getIdUnidades()
    {
        return $this->id_unidades;
    }

    /**
     * @param integer $id_unidades
     * @return Unidades
     */
    public function setIdUnidades($id_unidades)
    {
        $this->id_unidades = $id_unidades;
        return $this;
    }

    /**
     * @return string
     */
    public function getUnidade()
    {
        return $this->unidade;
    }

    /**
     * @param string $unidade
     * @return Unidades
     */
    public function setUnidade($unidade)
    {
        $this->unidade = $unidade;
        return $this;
    }

    /**
     * @return integer
     */
    public function getVagas()
    {
        return $this->vagas;
    }

    /**
     * @param integer $vagas
     * @return Unidades
     */
    public function setVagas($vagas)
    {
        $this->vagas = $vagas;
        return $this;
    }

    /**
     * @return string
     */
    public function getLocal()
    {
        return $this->local;
    }

    /**
     * @param string $local
     * @return Unidades
     */
    public function setLocal($local)
    {
        $this->local = $local;
        return $this;
    }

    /**
     * @return integer
     */
    public function getOcupado()
    {
        return $this->ocupado;
    }

    /**
     * @param integer $ocupado
     * @return Unidades
     */
    public function setOcupado($ocupado)
    {
        $this->ocupado = $ocupado;
        return $this;
    }

    /**
     * @return integer
     */
    public function getAlugado()
    {
        return $this->alugado;
    }

    /**
     * @param integer $alugado
     * @return Unidades
     */
    public function setAlugado($alugado)
    {
        $this->alugado = $alugado;
        return $this;
    }


}