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
    
    public partial class Sport
    {
        public int id_sport { get; set; }
        public System.DateTime record_date { get; set; }
        public Nullable<double> world_rec { get; set; }
        public string Sport_name { get; set; }
        public Nullable<int> fk_unit { get; set; }
        public Nullable<int> fk_Athletes { get; set; }
    
        public virtual Athletes Athletes { get; set; }
        public virtual UnitOfMea UnitOfMea { get; set; }
    }
}
