/*
 * IUser.java
 *
 * Created on May 2, 2006, 7:07 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package java.org.uta.sams.beans;

/**
 *
 * @author Administrator
 */
public interface IUser {
    
   String getUserId (); //{ return userId; }
   void setUserId (String userId); //{ this.userId = userId; }
   String getPassword (); //{ return password; }
   void setPassword (String password); //{ this.password = password; }
   int getLevel (); //{ return level; }
   void setLevel (int level); //{ this.level = level; }
    
}
