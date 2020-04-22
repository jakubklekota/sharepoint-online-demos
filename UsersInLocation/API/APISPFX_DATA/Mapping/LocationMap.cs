using APISPFX_DATA.Entities.Locations;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace APISPFX_DATA.Mapping
{
  public class LocationMap : IEntityTypeConfiguration<Location>
  {
    public void Configure(EntityTypeBuilder<Location> location)
    {
      location.HasKey(l => l.Id);
      location.Property(l => l.Name).IsRequired().HasMaxLength(1000);

      location.Property(l => l.IsActive).IsRequired();
      location.Property(l => l.IsDeleted).IsRequired();
      location.Property(l => l.CreatedOnUtc).IsRequired();
    }
  }
}
