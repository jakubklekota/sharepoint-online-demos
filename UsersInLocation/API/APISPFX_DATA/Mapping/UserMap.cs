using APISPFX_DATA.Entities.Users;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace APISPFX_DATA.Mapping
{
  public class UserMap : IEntityTypeConfiguration<User>
  {
    public void Configure(EntityTypeBuilder<User> user)
    {
      user.HasKey(u => u.Id);
      user.Property(u => u.FirstName).IsRequired().HasMaxLength(100);
      user.Property(u => u.LastName).IsRequired().HasMaxLength(1000);
      user.Property(u => u.Phone).IsRequired().HasMaxLength(50);

      user.Property(u => u.IsActive).IsRequired();
      user.Property(u => u.IsDeleted).IsRequired();
      user.Property(u => u.CreatedOnUtc).IsRequired();
    }
  }
}
