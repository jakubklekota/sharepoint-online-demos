using APISPFX_DATA.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace APISPFX_DATA.Repository
{
  public interface IRepository<T> where T : BaseEntity
  {
    IQueryable<T> Table();

    void Add(T entity, CancellationToken cancellationToken = default(CancellationToken));

    Task<T> GetAsync(Expression<Func<T, bool>> predicate,
        bool disableTracking = true,
        params Expression<Func<T, object>>[] includes);

    Task<IList<T>> GetListAsync(Expression<Func<T, bool>> predicate,
        bool disableTracking = true,
        params Expression<Func<T, object>>[] includes);

    Task UpdateAsync(T entity);
  }
}
