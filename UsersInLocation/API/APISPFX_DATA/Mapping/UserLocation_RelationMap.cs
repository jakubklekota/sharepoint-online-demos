using APISPFX_DATA.Entities.Relations;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace APISPFX_DATA.Mapping
{
  public class UserLocation_RelationMap : IEntityTypeConfiguration<UserLocation_Relation>
  {
    public void Configure(EntityTypeBuilder<UserLocation_Relation> location)
    {
      location.HasKey(u => u.Id);

      location.Property(u => u.IdUser).IsRequired();
      location.Property(l => l.IdLocation).IsRequired();

      location.HasOne(a => a.User).WithMany().HasForeignKey(a => a.IdUser);

      location.HasOne(a => a.Location).WithMany().HasForeignKey(a => a.IdLocation);
    }
  }
}
