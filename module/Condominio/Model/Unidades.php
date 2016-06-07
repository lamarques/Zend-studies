<?php
namespace Condominio\Model;

use Doctrine\ORM\Mapping as ORM;

use Zend\InputFilter\InputFilter;
use Zend\InputFilter\InputFilterAwareInterface;
use Zend\InputFilter\InputFilterInterface;

/**
 * @ORM\Entity
 */
class Unidades  implements InputFilterAwareInterface
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


    protected $inputFilter;
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

    public function exchangeArray($data)
    {
        if(isset($data['id_unidades']) and  $data['id_unidades']){
            $this->setIdUnidades($data['id_unidades']);
        }
        if(isset($data['unidade'])) {
            $this->setUnidade($data['unidade']);
        }
        if(isset($data['vagas'])){
            $this->setVagas($data['vagas']);
        }
        if(isset($data['local'])){
            $this->setVagas($data['local']);
        }
        if (isset($data['ocupado'])){
            $this->setOcupado(true);
        }
        if (isset($data['alugado'])){
            $this->setAlugado(true);
        }
    }

    public function setInputFilter(InputFilterInterface $inputFilter)
    {
        throw new \Exception("Not used");
    }

    public function getInputFilter()
    {
        if (!$this->inputFilter) {
            $inputFilter = new InputFilter();

            $inputFilter->add(array(
                'name'     => 'id_unidades',
                'required' => true,
                'filters'  => array(
                    array('name' => 'Int'),
                ),
            ));

            $inputFilter->add(array(
                'name'     => 'unidade',
                'required' => true,
                'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(
                    array(
                        'name'    => 'StringLength',
                        'options' => array(
                            'encoding' => 'UTF-8',
                            'min'      => 1,
                            'max'      => 45,
                        ),
                    ),
                ),
            ));

            $inputFilter->add(array(
                'name'     => 'vagas',
                'required' => true,
                'filters'  => array(
                    array('name' => 'Int'),
                ),
                'validators' => array(
                    array(
                        'name'    => 'Between',
                        'options' => array(
                            'min'      => 1,
                            'max'      => 2,
                        ),
                    ),
                ),
            ));


            $inputFilter->add(array(
                'name'     => 'local',
                'required' => true,
                'filters'  => array(
                    array('name' => 'StripTags'),
                    array('name' => 'StringTrim'),
                ),
                'validators' => array(
                    array(
                        'name'    => 'StringLength',
                        'options' => array(
                            'encoding' => 'UTF-8',
                            'min'      => 1,
                            'max'      => 255,
                        ),
                    ),
                ),
            ));

            $inputFilter->add(array(
                'name'     => 'ocupado',
                'required' => false,
                'filters'  => array(
                    array('name' => 'Int'),
                ),
            ));

            $inputFilter->add(array(
                'name'     => 'alugado',
                'required' => false,
                'filters'  => array(
                    array('name' => 'Int'),
                ),
            ));

            $this->inputFilter = $inputFilter;
        }

        return $this->inputFilter;
    }


}