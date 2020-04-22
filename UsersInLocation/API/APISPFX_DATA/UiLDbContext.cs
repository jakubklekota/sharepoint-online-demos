using APISPFX_DATA.Entities.Locations;
using APISPFX_DATA.Entities.Relations;
using APISPFX_DATA.Entities.Users;
using APISPFX_DATA.Mapping;
using Microsoft.EntityFrameworkCore;

namespace APISPFX_DATA
{
  public class UiLDbContext : DbContext
  {
    public UiLDbContext(
            DbContextOptions<UiLDbContext> options)
            : base(options) { }

    public DbSet<User> User { get; set; }

    public DbSet<Location> Location { get; set; }
    public DbSet<UserLocation_Relation> UserLocation_Relation { get; set; }

    protected override void OnModelCreating(ModelBuilder builder)
    {
      builder.ApplyConfiguration(new LocationMap());
      builder.ApplyConfiguration(new UserMap());
      builder.ApplyConfiguration(new UserLocation_RelationMap());
        
        base.OnModelCreating(builder);
    }
  }
}
