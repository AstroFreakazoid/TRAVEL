﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static TRV.Entidades.TRV_Exception;

namespace TRV.AccesoDatos.Mapper.Base
{
    public abstract class EntityMapper
    {
              
        protected string GetStringValue(Dictionary<string, object> dic, string attName)
       {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is string)
                return (string)val;

            return "";
        }

        protected int GetIntValue(Dictionary<string, object> dic, string attName)
        {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is int)
                return (int)dic[attName];

            return -1;
        }

        protected decimal GetDecimalValue(Dictionary<string, object> dic, string attName)
        {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is decimal)
                return (decimal)dic[attName];

            return -1m;
        }

        protected float GetFloatValue(Dictionary<string, object> dic, string attName)
        {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is float)
                return (float)dic[attName];

            return -1;
        }

        protected double GetDoubleValue(Dictionary<string, object> dic, string attName)
        {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is double)
                return (double)dic[attName];

            return -1;
        }

        protected DateTime GetDateValue(Dictionary<string, object> dic, string attName)
        {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is DateTime)
                return (DateTime)dic[attName];

            return DateTime.Now;
        }

        protected ExceptionCode GetExceptionCodeValue(Dictionary<string, object> dic, string attName)
        {
            var val = dic[attName];
            if (dic.ContainsKey(attName) && val is string)
                return (ExceptionCode)Enum.Parse(typeof(ExceptionCode), ((string)dic[attName]));

            return ExceptionCode.Fatal;
        }

    }
}

