//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Пр.Classes
{
    using System;
    using System.Collections.Generic;
    
    public partial class USERS
    {
        public int id { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public Nullable<int> id_Athletes { get; set; }
    
        public virtual Athletes Athletes { get; set; }
    }
}
