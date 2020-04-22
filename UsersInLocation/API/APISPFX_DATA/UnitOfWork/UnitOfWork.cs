using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using APISPFX_DATA.Base;
using APISPFX_DATA.Repository;

namespace APISPFX_DATA.UnitOfWork
{
  public class UnitOfWork<TContext> : IUnitOfWork<TContext>, IUnitOfWork where TContext : UiLDbContext, IDisposable
  {
    private Dictionary<Type, object> _repositories;

    public TContext Context { get; }

    public UnitOfWork(TContext dbContext)
    {
      Context = dbContext;
    }

    public IRepository<TEntity> GetRepositoryAsync<TEntity>() where TEntity : BaseEntity
    {
      if (_repositories == null) _repositories = new Dictionary<Type, object>();

      var type = typeof(TEntity);
      if (!_repositories.ContainsKey(type)) _repositories[type] = new Repository<TEntity>(Context);
      return (IRepository<TEntity>)_repositories[type];
    }

    public async Task<int> SaveChangesAsync()
    {
      return await Context.SaveChangesAsync();
    }

    public void Dispose()
    {
      Context?.Dispose();
    }
  }
}
