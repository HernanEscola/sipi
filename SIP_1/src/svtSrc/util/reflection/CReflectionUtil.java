package conicet.apps.svt.util.reflection;

import java.lang.annotation.Annotation;
import java.lang.reflect.AnnotatedElement;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang.StringUtils;


public class CReflectionUtil {


	enum  TipoAnnotatedElement{
		field, method;
	}
	public static List<Method> getMethodsAnnotatedWith(final Class<?> type, final Class<? extends Annotation> annotation) {
	    return (List<Method>) getAnnotatedElementsAnnotatedWith(type, annotation, TipoAnnotatedElement.method);
	}

	
	public static Method getUniqueMethodAnnotatedWith(final Class<?> type, final Class<? extends Annotation> annotation) {
	    List<Method> methods = getMethodsAnnotatedWith(type, annotation);
	    if(methods.isEmpty()){
	    	return null;
	    }else{
	    	return methods.get(0);
	    }
	}


	public static String getPropertyName(Method m){
		if(m!=null){
			return getPropertyName(m.getName());
		}
		return null;
	}

	public static String getPropertyName(String methodName) {
		String name = methodName;
		try {

			if ((name.startsWith("get") || name.startsWith("set")) && (name.length() > 3 && isUpperCase(name.substring(3, 4)))) {
				name = name.substring(3);
				name = name.substring(0, 1).toLowerCase() + name.substring(1);
			}
		} catch (Exception e) {
			return name;
		}
		return name;
	}

	public static boolean isUpperCase(String s){
		return StringUtils.isEmpty(s) || s.toUpperCase().equals(s);
	}

	public static boolean isLowerCase(String s){
		return StringUtils.isEmpty(s) || s.toLowerCase().equals(s);
	}

	public static String getterName(String propertyName) {
		return "get"+propertyName.substring(0,1).toUpperCase()+propertyName.substring(1);
	}

	public static Method getMethodSetterByGetter(Method method){
		Method encontrado = null;
		String propertyName = getPropertyName(method);
		try {
			encontrado = method.getDeclaringClass().getMethod(setterName(propertyName), method.getReturnType());
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return encontrado;
	}

	public static Method getMethodSetterByPropertyName(String propertyName, Class clazz){
		Method getter = null;
		try {
			getter = clazz.getMethod(getterName(propertyName));
			return getMethodSetterByGetter(getter);
		} catch (NoSuchMethodException e) {
			e.printStackTrace();
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static String setterName(String propertyName) {
		return "set"+propertyName.substring(0,1).toUpperCase()+propertyName.substring(1);
	}

	public static String getterName2(String propertyName) {
		return "is"+propertyName.substring(0,1).toUpperCase()+propertyName.substring(1);
	}




	protected static  List<? extends AnnotatedElement>  getAnnotatedElementsAnnotatedWith(final Class<?> type, final Class<? extends Annotation> annotation, TipoAnnotatedElement tipo ) {
		final List<AnnotatedElement> annotatedsElements = new ArrayList<AnnotatedElement>();
	    Class<?> klass = type;
	    while (klass != Object.class) { // need to iterated thought hierarchy in order to retrieve methods from above the current instance
	        // iterate though the list of methods declared in the class represented by klass variable, and add those annotated with the specified annotation
	    	List<? extends AnnotatedElement> elements = Arrays.asList(TipoAnnotatedElement.method.equals(tipo)? klass.getDeclaredMethods():klass.getDeclaredFields());

	    	final List<AnnotatedElement> allAnnotatedElements = new ArrayList<AnnotatedElement>(elements);
	        for (final AnnotatedElement element : allAnnotatedElements) {
	            if (annotation == null || element.isAnnotationPresent(annotation)) {
	               // Annotation annotInstance = element.getAnnotation(annotation);
	                // TODO process annotInstance
	                annotatedsElements.add(element);
	            }
	        }
	        // move to the upper class in the hierarchy in search for more methods
	        klass = klass.getSuperclass();
	    }
	    return annotatedsElements;
	}


	public static List<Field> getFieldsAnnotatedWith(final Class<?> type, final Class<? extends Annotation> annotation) {
	    return (List<Field>) getAnnotatedElementsAnnotatedWith(type, annotation, TipoAnnotatedElement.field);
	}


	public static Field getUniqueFieldAnnotatedWith(final Class<?> type, final Class<? extends Annotation> annotation) {
	    List<Field> methods = getFieldsAnnotatedWith(type, annotation);
	    if(methods.isEmpty()){
	    	return null;
	    }else{
	    	return methods.get(0);
	    }
	}


	public static boolean hasAnnotation(Class<?> type, Class<? extends Annotation> annotation) {
		Class<?> clazz = type;
	    while (clazz != Object.class) {
	            if (clazz.isAnnotationPresent(annotation)) {
	               return true;
	            }
	        // move to the upper class in the hierarchy in search for more methods
	        clazz = clazz.getSuperclass();
	    }
	    return false;
	}



	public static <A extends Annotation> A getAnnotation(Class<?> type, Class<A> annotationClass) {
		Class<?> clazz = type;
	    while (clazz != Object.class) {
	            if (clazz.isAnnotationPresent(annotationClass)) {
	               return clazz.getAnnotation(annotationClass);
	            }
	        // move to the upper class in the hierarchy in search for more methods
	        clazz = clazz.getSuperclass();
	    }
	    return null;
	}


}
