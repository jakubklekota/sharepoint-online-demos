using APISPFX_DATA.Base;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading;
using System.Threading.Tasks;

namespace APISPFX_DATA.Repository
{
  public class Repository<T> : IRepository<T> where T : BaseEntity
  {
    protected readonly DbContext _dbContext;
    protected readonly DbSet<T> _dbSet;

    public Repository(DbContext dbContext)
    {
      this._dbContext = dbContext;
      this._dbSet = _dbContext.Set<T>();
    }

    public IQueryable<T> Table()
    {
      return _dbSet.Where(a => a.IsActive && !a.IsDeleted);
    }

    public virtual void Add(T entity, CancellationToken cancellationToken = default(CancellationToken))
    {
      _dbSet.Add(entity);
    }
    
    public async Task<T> GetAsync(Expression<Func<T, bool>> predicate,
        bool disableTracking = true,
        params Expression<Func<T, object>>[] includes)
    {
      IQueryable<T> query = Table();

      if (disableTracking)
      {
        query = query.AsNoTracking();
      }

      foreach (var include in includes)
      {
        query = query.Include(include);
      }

      if (predicate != null)
      {
        query = query.Where(predicate);
      }

      return await query.FirstOrDefaultAsync();
    }

    public async Task<IList<T>> GetListAsync(Expression<Func<T, bool>> predicate,
        bool disableTracking = true,
        params Expression<Func<T, object>>[] includes)
    {
      try
      {
        IQueryable<T> query = Table();

        if (disableTracking) query = query.AsNoTracking();

        foreach (var include in includes)
        {
          query = query.Include(include);
        }

        if (predicate != null) query = query.Where(predicate);

        return await query.ToListAsync();
      }
      catch(Exception ex)
      {
        return await Task.FromResult<IList<T>>(null);
      }
    }

    public async Task UpdateAsync(T entity)
    {
        _dbSet.Attach(entity);

        _dbContext.Entry(entity).State = EntityState.Modified;

        await _dbContext.SaveChangesAsync();
    }
  }
}
