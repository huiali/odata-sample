﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
using System;
using System.Collections.Generic;

namespace Architecture.Sample.Expand.Models
{
    public partial class A
    {
        public long Numericalorder { get; set; }
        public string Aname { get; set; }
        public ICollection<B> B { set; get; }
    }
}