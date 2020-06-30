using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Architecture.Sample.Expand.Models;
using Microsoft.AspNet.OData;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Architecture.Sample.Expand.Controllers
{
    public class AController : ODataController
    {
        readonly TestContext _context;
        public AController(TestContext context)
        {
            _context = context;
        }

        [EnableQuery]
        public IQueryable<A> Get()
        {
            return _context.A;
        }
    }
}