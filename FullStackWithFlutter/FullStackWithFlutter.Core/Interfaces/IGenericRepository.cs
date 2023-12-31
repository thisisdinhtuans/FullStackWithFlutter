﻿using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace FullStackWithFlutter.Core.Interfaces
{
    public interface IGenericRepository<T> where T:class
    {
        Task<T> Get(int id);
        Task<IEnumerable<T>> GetAll();
        Task Add(T entity);
        void Delete(T entity);
        void Update(T entity);
    }
}
