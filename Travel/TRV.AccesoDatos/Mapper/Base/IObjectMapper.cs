﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TRV.Entidades;

namespace TRV.AccesoDatos.Mapper.Base
{
    interface IObjectMapper
    {
        List<EntidadBase> BuildObjects(List<Dictionary<String, object>> values);
        EntidadBase BuildObject(Dictionary<string, object> values);

    }
}
