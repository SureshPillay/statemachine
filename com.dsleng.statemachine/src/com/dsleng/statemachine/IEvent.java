/**
 * 
 */
package com.dsleng.statemachine;

/**
 * @author suresh
 *
 */
public interface IEvent {
	public String getName();
	public void setName(String name);
	public int getId();
	public void setId(int id);
}
