<?php

namespace Condominio\Model;



class UnidadeModel implements InputFilterAwareInterface
{
    public $id_unidades;
    public $unidade;
    public $vagas;
    public $local;
    public $ocupado;
    public $alugado;
    protected $inputFilter;

    


}