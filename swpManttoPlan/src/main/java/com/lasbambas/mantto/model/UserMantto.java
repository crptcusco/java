package com.lasbambas.mantto.model;

import javax.persistence.Entity;

import java.io.Serializable;

import javax.persistence.Id;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.lang.Override;
import java.util.Set;

@SuppressWarnings("serial")
@Entity
@Table(schema = "APP")
public class UserMantto implements Serializable
{
	/*--------- -----------*/
   @Id
   @GeneratedValue(strategy = GenerationType.IDENTITY)
   private Long id;

   @NotNull
   @Column(unique=true, length = 50)
   private String userName;

   @NotNull
   private String name;

   @NotNull
   @JsonIgnore
   private String pass;

   @NotNull
   private String email;
   @ManyToMany
   @JoinTable(name="APP.UserGroups",
   				joinColumns={@JoinColumn(name="userMantto_id")},
   				inverseJoinColumns={@JoinColumn(name="groups_id")})
   private Set<Groups> groups;  

/*--------- getters and setters-----------*/
   public Long getId()
   {
      return this.id;
   }

   public void setId(final Long id)
   {
      this.id = id;
   }

   @Override
   public boolean equals(Object obj)
   {
      if (this == obj)
      {
         return true;
      }
      if (!(obj instanceof UserMantto))
      {
         return false;
      }
      UserMantto other = (UserMantto) obj;
      if (id != null)
      {
         if (!id.equals(other.id))
         {
            return false;
         }
      }
      return true;
   }

   @Override
   public int hashCode()
   {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((id == null) ? 0 : id.hashCode());
      return result;
   }

   public String getUserName()
   {
      return userName;
   }

   public void setUserName(String userName)
   {
      this.userName = userName;
   }

   public String getName()
   {
      return name;
   }

   public void setName(String name)
   {
      this.name = name;
   }

   public String getPass()
   {
      return pass;
   }

   public void setPass(String pass)
   {
      this.pass = pass;
   }

   public String getEmail()
   {
      return email;
   }

   public void setEmail(String email)
   {
      this.email = email;
   }
   
   public Set<Groups> getGroups() {
		return groups;
	}

	public void setGroups(Set<Groups> groups) {
		this.groups = groups;
	}

   @Override
   public String toString()
   {
      String result = getClass().getSimpleName() + " ";
      if (userName != null && !userName.trim().isEmpty())
         result += "UserName: " + userName;
      if (name != null && !name.trim().isEmpty())
         result += ", Name: " + name;
      if (pass != null && !pass.trim().isEmpty())
         result += ", Pass: " + pass;
      if (email != null && !email.trim().isEmpty())
         result += ", Email: " + email;
      return result;
   }
}