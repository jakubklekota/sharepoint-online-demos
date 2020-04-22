using APISPFX_DATA.Base;
using APISPFX_DATA.Repository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace APISPFX_DATA.UnitOfWork
{
  public interface IUnitOfWork : IDisposable
  {
    IRepository<TEntity> GetRepositoryAsync<TEntity>() where TEntity : BaseEntity;

    Task<int> SaveChangesAsync();
  }

  public interface IUnitOfWork<TContext> : IUnitOfWork where TContext : UiLDbContext
  {
    TContext Context { get; }
  }
}
